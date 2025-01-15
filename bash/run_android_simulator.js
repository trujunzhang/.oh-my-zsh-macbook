const path = require("path");
const { exec, spawn } = require("child_process");

var argv = process.argv.slice(2);
console.log(JSON.stringify(argv));

//const mainActivity = "com.ieatta.track.MainActivity";
//const packageName = "com.ieatta.track.dev";

let mainActivity = "";
let packageName = "";

for (let i = 0; i < argv.length; i++) {
  switch (argv[i]) {
    case "--mainActivity": {
      mainActivity = argv[++i];
      break;
    }
    case "--packageName": {
      packageName = argv[++i];
      break;
    }
  }
}

console.log("packageName:", packageName, " mainActivity:", mainActivity);

const androidSDKHome =
  process.env["ANDROID_HOME"] || process.env["ANDROID_SDK_ROOT"];
if (!androidSDKHome) {
  console.log("Please set env variable $ANDROID_HOME or $ANDROID_SDK_ROOT".red);
  return;
}
const adbPath = path.resolve(androidSDKHome, "platform-tools", "adb");
const emulatorPath = path.resolve(androidSDKHome, "emulator", "emulator");

//Starting: Intent { act=android.intent.action.MAIN cat=[android.intent.category.LAUNCHER] cmp=com.ieatta.track.dev/com.ieatta.track.MainActivity }
async function run_android_app() {
  exec(`${adbPath} shell am start -n ${packageName}/${mainActivity}`, (error, stdout, stderr) => {
    if (error) {
      console.error(`exec error: ${error}`);
      return;
    }
    console.log(`stdout: ${stdout}`);
    console.error(`stderr: ${stderr}`);
  });

}

async function run_android_simulator() {
  exec(`${emulatorPath} -avd genymotion`, (error, stdout, stderr) => {
    if (error) {
      console.error(`exec error: ${error}`);
      return;
    }
    console.log(`stdout: ${stdout}`);
    console.error(`stderr: ${stderr}`);
  });
}

const delay = (ms) => new Promise((res) => setTimeout(res, ms));

async function main() {
  run_android_simulator();
  await delay(20000);
  await run_android_app();
}

main();
