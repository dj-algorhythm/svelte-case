const CaseRepository = artifacts.require("CaseRepository");

module.exports = async function (deployer) {
	await deployer.deploy(CaseRepository);
};
