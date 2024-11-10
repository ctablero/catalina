MIGRATION_WORKFLOW_DIRECTORY="${GITHUB_WORKSPACE%/}/migrations"
MIGRATION_ACTION_DIRECTORY="${GITHUB_ACTION_PATH%/}/knex/migrations"

if [ -d "$MIGRATION_WORKFLOW_DIRECTORY" ]; then
    mkdir -p $MIGRATION_ACTION_DIRECTORY && cp ${MIGRATION_WORKFLOW_DIRECTORY}/* $MIGRATION_ACTION_DIRECTORY
    echo "Copied migration files."
else
    echo "Could not find a migrations folder in the root of your project."
    exit 1
fi