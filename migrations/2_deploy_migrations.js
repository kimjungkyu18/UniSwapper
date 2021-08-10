let UniSwapper = artifacts.require("UniSwapper");

module.exports = async function (deployer) {
    // The UniSwap v3 swapRouter contract address on Kovan testnet
    const swapRouterAddress = "0xE592427A0AEce92De3Edee1F18E0157C05861564";

    await deployer.deploy(UniSwapper, swapRouterAddress);
};
