# TerminalStyle
<p align="center">
    <img src="https://github.com/Novafinity/.github/blob/main/Terminalstyle_redo_large.png" alt="Terminalstyle" style="text-align:center;">
</p>

TerminalStyle is a collection of shell scripts that enhance your terminal experience with colorful and stylish text output.

### Features

- Generate random colored bordered lines with centered text
- Customize text and border colors with ease
- Simple and easy-to-use shell script

### Installation

1. Clone the TerminalStyle repository:
    ``` git clone https://github.com/novafinity/TerminalStyle/TerminalStyle.git ```
2. Change into the cloned directory:
    ``` cd TerminalStyle ```
3. Run the script:
    ``` ./run.sh ```
### Usage
To create a bordered line with centered text, use the print_bordered_line function in border.sh. Pass the desired text as an argument to the function.

    #!/bin/bash
    
    # Source the colors.sh file
    source colors.sh
    
    # Function to generate a random color code
    # ...
    
    # Function to print a bordered line with larger text
    print_bordered_line() {
        # ...
    }
    
    # Example usage
    print_bordered_line "Hello, World!"
    
### Contributing
Contributions are welcome! If you have any ideas, suggestions, or bug reports, please feel free to open an issue or submit a pull request.

### License
This project is licensed under the MIT License.

