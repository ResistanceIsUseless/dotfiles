## Reminders
- Sync todo with a local todo.md file so everything is backed up. If 'bd' is installed use it for task tracking.

'''
bd ready	List tasks with no open blockers.
bd create "Title" -p 0	Create a P0 task.
bd update <id> --claim	Atomically claim a task (sets assignee + in_progress).
bd dep add <child> <parent>	Link tasks (blocks, related, parent-child).
bd show <id>	View task details and audit trail.
'''

- If in a git repo always first check there is a .gitignore file and it excludes .DS_STORE, .env, ./tmp and other common directories and files that shouldnt ever be commited to the repo even if its private.

- Always use direnv or .env for using secrets and tokens. Unless there is absolutely no other option don't save tokens to any file besides .env or .envrc files.

```
echo export FOO=foo > .envrc
direnv allow .
```

## Best Practices
- When it makes sense use configuration files.
    Examples:
    Good: Dynamic values that can be changed by a user. Like a token, env variable or some user provided setting we don't want hardcoded in code.
    Bad: Runtime configuration settings like an argument. These can be in a config file but by default not required. Like a specific mode enabled through argument

- Be concise and avoid overly verbose documentation creation. Don't create a markdown file to document everything we did. If a markdown document is created always put it in the docs folder. If a user is asking for guidance or evaluation ask the user if they would like you to create a planning document or just a concise summary response.

- Avoid using /tmp. Create a ./tmp directory in the working directory and use that instead.

- Always check for skills that might provide addtional guidance or contect for domain specific knowledge.

- Keep a clean organizational structure. Avoid creating uneccessary scripts or documents in the root folder. If the file is expected to be short lived place it in ./tmp.
