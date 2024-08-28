# Project Structure Generator

A powerful PowerShell script for generating project structures based on various software architecture patterns.

## Features

- Generate project structures for:
  - Layered Architecture
  - Clean Architecture
  - Microservices Architecture
  - Event-Driven Architecture
- Create custom project structures using a configuration file
- Automatically generate README files for each project
- Cross-platform compatibility (Windows PowerShell and PowerShell Core)

## Prerequisites

- Windows PowerShell 5.1+ or PowerShell Core 6.0+

## Installation

1. Clone this repository or download the `project-structure-generator.ps1` file.
2. Ensure that your PowerShell execution policy allows running scripts. You may need to run PowerShell as an administrator and execute:
   ```powershell
   Set-ExecutionPolicy RemoteSigned
   ```

## Usage

1. Open PowerShell and navigate to the directory containing `project-structure-generator.ps1`.
2. Run the script:
   ```powershell
   .\project-structure-generator.ps1
   ```
3. Enter your project name when prompted.
4. Choose an architecture pattern from the menu.
5. The script will generate the project structure in the current directory.

## Custom Architecture

To use a custom architecture:

1. Create a file named `filearchitecture.config` in the same directory as the script.
2. Define your custom structure in the file (see example below).
3. Run the script and choose option 5 for Custom Architecture.

Example `filearchitecture.config`:

```
my_project/
  src/
    main.py
    utils.py
  tests/
    test_main.py
  docs/
    README.md
  requirements.txt
  .gitignore
```

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request to add more architectures.

## License

This project is open source and available under the [MIT License](LICENSE).
