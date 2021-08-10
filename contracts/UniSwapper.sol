pragma solidity =0.7.6;
pragma abicoder v2;

import "@uniswap/v3-periphery/contracts/interfaces/ISwapRouter.sol";
import "@uniswap/v3-periphery/contracts/libraries/TransferHelper.sol";

contract UniSwapper {
    ISwapRouter public immutable swapRouter;

    // Set the pool fee to 0.3%.
    uint24 public constant poolFee = 3000;

    constructor(ISwapRouter _swapRouter) {
        swapRouter = _swapRouter;
    }

    // Swaps _tokenIn for the max amount of _tokenOut
    function swap(
        uint256 _amountIn,
        address _tokenIn,
        address _tokenOut
    ) public returns (uint256 amountOut) {
        // Transfer _amountIn of _tokenIn to this contract
        TransferHelper.safeTransferFrom(
            _tokenIn,
            msg.sender,
            address(this),
            _amountIn
        );

        // Approve the swap router
        TransferHelper.safeApprove(_tokenIn, address(swapRouter), _amountIn);

        ISwapRouter.ExactInputSingleParams memory params = ISwapRouter
            .ExactInputSingleParams({
                tokenIn: _tokenIn,
                tokenOut: _tokenOut,
                fee: poolFee,
                recipient: msg.sender,
                deadline: block.timestamp,
                amountIn: _amountIn,
                amountOutMinimum: 0,
                sqrtPriceLimitX96: 0
            });

        // The call to `exactInputSingle` executes the swap.
        amountOut = swapRouter.exactInputSingle(params);
    }
}
