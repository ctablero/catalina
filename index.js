const core = require('@actions/core');
const github = require('@actions/github');

try {
    const dbUser = core.getInput(db-user);
    console.log(dbUser);

    const time = (new Date()).toTimeString();
    console.log(time);

} catch (error) {
    core.setFailed(error.message);
}