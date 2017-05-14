# Docker builder container

Two uses cases for this

  1. Run scripts in a clear reproducible environment
  2. Compile environment is different than execution environment

### Quick start
```bash
# run this, replace string with any value
./build_stuff.sh 'amazing_env_var'
```

### What is happening

'copy_env.sh' needs all our current environment variables, and will paste them
to a text file. We don't want to use our host environment for this. So our
script:
 * Constructs a new image specified in the dockerfile, with our script included
 * Builds a new docker container, sets our environment variables, and runs our script from inside the container
 * Copies the result, from inside the container onto our host system
 * Removes the builder container
