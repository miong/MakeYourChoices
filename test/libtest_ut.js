var libtest = require("./libtest");
module.exports.testRunnable = () => {

libtest.declare_module("declare_module");

libtest.declare_test("declare_module", "declare_twice", function ()
{
	libtest.declare_module("Toto");
	libtest.assert().throws(() => {libtest.declare_module("Toto")}, "declare_module should throw on declare twice.");
});


}

