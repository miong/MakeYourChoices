const assertStrict = require('assert').strict;
var testFiles = []
var currentTestFile = ""
var currentModules = new Map();

class Module
{
	constructor(name) {
		this.name = name;
		this.testMap = new Map();
		this.setup = () => {};
	}
	
	addTest(testName, functionPtr)
	{
		if(this.testMap.has(testName))
		{
			assertStrict.fail(testName+" test declared twice in same module : "+this.name);
		}
		this.testMap.set(testName, functionPtr);
	}
	
	addSetup(functionPtr)
	{
		this.setup = functionPtr;
	}
	
	run ()
	{
		this.setup();
		var moduleRes = true;
		var moduleName = this.name;
		this.testMap.forEach(function(value, key, map)
		{
			var testRes;
			try
			{
				testRes = value();
				if(testRes == undefined)
				{
					testRes = true;
				}
			}
			catch(e)
			{
				console.log("Error : "+e.message);
				testRes = false;
			}
			if(testRes)
			{
				console.log("Run "+moduleName+"."+key+" : SUCCESS");
			}
			else
			{
				console.log("Run "+moduleName+"."+key+" : FAILED");
			}
			moduleRes &= testRes;
		});
		return moduleRes;
	}
	
};

module.exports = {
	
	declare_testfile : function (testfile)
	{
		console.log("Add test file declaration : "+testfile);
		testFiles.push(testfile);
	},
	
	declare_module : function (moduleName)
	{
		if(currentModules.has(moduleName))
		{
			assertStrict.fail(moduleName+" module declared twice in same test file : "+currentTestFile);
		}
		currentModules.set(moduleName, new Module(moduleName));
	},
	
	declare_test : function (moduleName, testName, testFunction)
	{
		assertStrict.ok(currentModules.has(moduleName), "Module "+moduleName+" have not been declared yet.");
		currentModules.get(moduleName).addTest(testName, testFunction);
	},
	
	module_setup: function(moduleName, setupFunction)
	{
		assertStrict.ok(currentModules.has(moduleName), "Module "+moduleName+" have not been declared yet.");
		currentModules.get(moduleName).addSetup(setupFunction);
	},
	
	todo: function(string)
	{
		this.warn("[TO DO] "+string);
	},
	
	warn: function(string)
	{
		console.log("Warning : "+string);
	},
	
	fail: function(string)
	{
		console.log("Error : "+string);
		assertStrict.fail("fail methode called");
	},
	
	assert : function ()
	{
		return assertStrict;
	},
	

	execute_tests : function ()
	{
		console.log("");
		console.log("Start tests execution from "+testFiles.length+" files");
		var failedModules = [];
		testFiles.forEach(function (testfile)
		{
			currentModules.clear();
			console.log("");
			console.log("--------------------");	
			console.log("Executing "+testfile);
			console.log("--------------------");
			currentTestFile = testfile;
			var module = require("./"+testfile);
			module.testRunnable();
			currentModules.forEach(function(value, key, map)
			{
				if(!value.run())
				{
					failedModules.push(testfile+"."+value.name);
				}
			});
			
		});
		console.log("");
		console.log("");
		if(failedModules.length == 0)
		{
			console.log("");
			console.log("");
			console.log("Final result is SUCCESS");
		}
		else
		{
			console.log("--------------------");
			console.log("List of failing modules");
			console.log("--------------------");
			failedModules.forEach(function (moduleName)
			{
				console.log(moduleName);
			});
			console.log("");
			console.log("");
			console.log("Final result is FAILED");
			console.log("");
			console.log("");
		}
		if(failedModules.length == 0)
		{
			process.exit(0);
		}
		console.log(failedModules.length+" scenario(s) failed");
		process.exit(1);
	},
	
	verify_requirements : function()
	{
		var semver = require("semver");

		const min_node_version = ">=10.19.0";
		const min_npm_version = ">=6.14.4";
		
		var child_process = require('child_process');
		
		if (!semver.satisfies(process.version, min_node_version)) {
			console.log(`Required node version ${min_node_version} not satisfied with current version ${process.version}.`);
			process.exit(1);
		}
		console.log("Node version is OK : "+process.version);

		var npmVersion = "v"+child_process.execSync('npm --version');
		if (!semver.satisfies(npmVersion, min_npm_version)) {
			console.log(`Required npm version ${min_npm_version} not satisfied with current version ${npmVersion}.`);
			process.exit(1);
		}
		console.log("Npm version is OK : "+npmVersion);
	}
};