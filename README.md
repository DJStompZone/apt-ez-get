# apt-ez-get

Quality-of-life bash script for effortlessly installing packages with apt-get on Debian-based systems.
Simply invoke the script via the command line with the names of 1 or more packages to install.


<img height="25" src="https://i.imgur.com/6otUFVb.png"> <img height="25" src="https://i.imgur.com/5lYnJJa.png"> <a href="https://discord.gg/stompzone"><img height="25" src="https://i.imgur.com/D6LaH8n.png"></a>


## Usage

You will need to ensure the script is executable with

```bash
chmod a+x ./apt-ez-get.sh
```

You can then use apt-ez-get.sh as-is with:

```bash
sudo ./apt-ez-get.sh <package1> <package2> <packageX>
```

## Adding an Alias

You may find it more convenient to create an alias for easy access.
To do so, you can use the following command to append an alias to your `.bashrc` file:
(Assuming you are currently in the same directory as apt-ez-get.sh)

```bash
# Create a persistent alias 'ezget' to call the script with the necessary permissions
echo -e alias ezget='"'"sudo `realpath .`/apt-ez-get.sh"'"' >> ~/.bashrc
source ~/.bashrc
```

Now you can use the script from anywhere with:

```bash
ezget <package1> <package2> <packageX>
```
