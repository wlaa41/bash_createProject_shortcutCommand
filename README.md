# cproj

`cproj` is a Bash command-line tool designed to streamline the process of setting up new projects. With `cproj`, you can quickly create a new project directory, initialize a Python virtual environment, set up a Git repository with a customized `.gitignore` file, and optionally add a Dockerfile.

## Features

- **Create Project Directory**: Automatically create a new directory for your project.
- **Python Virtual Environment**: Optionally initialize a Python virtual environment.
- **Git Initialization**: Set up a Git repository and a pre-configured `.gitignore` file suitable for Python projects.
- **Dockerfile Creation**: Optionally add a Dockerfile to your project setup.

## Installation

1. Clone the repository:
```bash
   git clone https://github.com/[your-username]/cproj.git
```

   Navigate to the cloned directory:
```bash
    cd cproj
```

  Make the script executable:

```bash
   chmod +x cproj.sh
```

 (Optional):
   To use `cproj` from any directory, you can add it to your PATH. Here's how you can do it:

   - First, find out the absolute path of your `cproj` directory. You can do this by running `pwd` in the `cproj` directory.
   - Then, add this path to your PATH variable. Edit your `~/.bashrc` or `~/.bash_profile` file (depending on your system) and add the following line at the end:

     ```bash
     export PATH="/path/to/cproj:$PATH"
     ```

     Replace `/path/to/cproj` with the actual path you found earlier.

   - Save the file and reload your profile with the command `source ~/.bashrc` or `source ~/.bash_profile`.

   Now, you should be able to run the `cproj` command from any directory.

## Usage

To create a new project, simply run:

```bash
cproj <project-name> [options]
     ```
## Options
1. -p, --python-venv: Create a Python virtual environment inside the project.
1. -g, --git: Initialize a Git repository and create a .gitignore file.
1. -d, --docker: Create a Dockerfile in the project directory.
1. -h, --help: Display the help information.
Examples
Create a basic project:

```bash
cproj myproject
     ```
Create a project with a Python virtual environment and Git initialization:

```bash
cproj myproject -pg
     ```
Create a full-stack project (Python virtual environment, Git, and Docker):

```bash
cproj myproject -pgd
     ```

## Contributing
Contributions to cproj are welcome! Feel free to fork the repository, make changes, and submit pull requests. For major changes, please open an issue first to discuss what you would like to change.

## License
This project is licensed under the MIT License.

## Author
Will Jamous
