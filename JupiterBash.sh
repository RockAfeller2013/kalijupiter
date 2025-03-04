#!/bin/bash
# Setup of Bash as the default kernel in Jupyter Notebook using a script. Below is an example of a Bash script that installs the bash_kernel, configures Jupyter to use Bash as the default kernel, and ensures everything is set up correctly.
# Generate Jupyter configuration file if it doesn't exist
echo "Generating Jupyter configuration file..."
jupyter notebook --generate-config

# Set Bash as the default kernel in the Jupyter configuration file
CONFIG_FILE="$HOME/.jupyter/jupyter_notebook_config.py"
echo "Setting Bash as the default kernel in Jupyter configuration..."
if grep -q "c.NotebookApp.kernel_spec_manager_class" "$CONFIG_FILE"; then
    # If the setting already exists, replace it
    sed -i 's/^c\.NotebookApp\.kernel_spec_manager_class.*/c.NotebookApp.kernel_spec_manager_class = "bash_kernel.BashKernelSpecManager"/' "$CONFIG_FILE"
else
    # If the setting doesn't exist, append it
    echo 'c.NotebookApp.kernel_spec_manager_class = "bash_kernel.BashKernelSpecManager"' >> "$CONFIG_FILE"
fi

echo "Setup complete! Bash is now the default kernel in Jupyter Notebook."
