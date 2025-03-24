# Tutorial 1: Introduction to command line and bash
By: Letícia Magpali

## Learning goals
* [Opening the terminal](https://github.com/Evolution-for-Everyone/bioinformatics-for-everyone/wiki/Tutorial-1:-Introduction-to-command-line-and-bash#1-opening-the-terminal)
* [The structure of the terminal](https://github.com/Evolution-for-Everyone/bioinformatics-for-everyone/wiki/Tutorial-1:-Introduction-to-command-line-and-bash#2-the-structure-of-the-terminal)
* [Using bash in the terminal](https://github.com/Evolution-for-Everyone/bioinformatics-for-everyone/wiki/Tutorial-1:-Introduction-to-command-line-and-bash#3-using-bash-in-the--terminal)
* [Moving between different directories](https://github.com/Evolution-for-Everyone/bioinformatics-for-everyone/wiki/Tutorial-1:-Introduction-to-command-line-and-bash#-moving-between-different-directories) 
* [Creating directories and files](https://github.com/Evolution-for-Everyone/bioinformatics-for-everyone/wiki/Tutorial-1:-Introduction-to-command-line-and-bash#-creating-directories-and-files)
* [Changing and moving files](https://github.com/Evolution-for-Everyone/bioinformatics-for-everyone/wiki/Tutorial-1:-Introduction-to-command-line-and-bash#-changing-and-moving-files)
* [Challenge: creating a folder structure](https://github.com/Evolution-for-Everyone/bioinformatics-for-everyone/wiki/Tutorial-1:-Introduction-to-command-line-and-bash#4-challenge-creating-a-folder-structure)
* [Installing software](https://github.com/Evolution-for-Everyone/bioinformatics-for-everyone/wiki/Tutorial-1:-Introduction-to-command-line-and-bash#5-installing-software)

## 1. Opening the terminal

🍄 **What is the terminal?**\
The terminal is a text-based interface where you communicate with your computer by typing commands. \
In Linux and MacOS systems, the terminal uses a programming language called **bash**. \
You can use the terminal to do anything you normally do in your computer! (for example, running programs, creating, editing and accessing files and folders.)

> [!TIP]
> _What's so special about the terminal?_ \
> It allows you to run a lot of programs that don't have a graphic interface! 

Many programs we use for analysis in evolutionary biology don't have a _graphic interface_ - that means they don't have an app, a screen or clickable icons, and we have to interact with them using only programming language.  

🍄 **Where do I find the terminal?**\
The terminal looks just like another app on your computer - but it will change slightly depending on the operating system you are on (Linux, MacOS or Windows). Follow the instructions below according to your system:

→ **For MacOS/Linux users**
* You can locate the **terminal** in the list of apps (launchpad) of your computer, 
* or using the search option by pressing the F4 key (which should have an eyeglass 🔍 icon) and then typing `terminal` into the search box. 
* The terminal icon looks like a black box with a `<` and a `-`, like this:
<img src="https://github.com/user-attachments/assets/8c8aa650-9fb9-4275-a871-a96ea0fa190a" width="200">

→ **For Windows users**
* The Windows native terminal does not work with **bash**, so it's not suitable for our needs. 
* When working with Windows computers, we need to install the Linux system to get access to the terminal. 
* For that, follow [this written tutorial](https://learn.microsoft.com/en-us/windows/wsl/install), or this [video tutorial](https://www.youtube.com/watch?v=sUsTQTJFmjs&ab_channel=ProgrammingKnowledge).

🐞 Once you have located the terminal on your computer, go ahead and open it! It should look like a black window with some text at the top, like this:

![Screenshot 2025-03-21 at 5 02 34 PM](https://github.com/user-attachments/assets/d1ca03b0-288d-47b1-879f-471da901e82b)

## 2. The structure of the terminal

Every time you open your terminal, you will see the following information at the top left corner:

``` bash
user@computer directory % # if you are using MacOS
    
user@computer:directory$ # if you are using Linux/Unix
```
> [!TIP]
> This line is called the **prompt**, and it means the computer is ready to accept a command from you - in other words, it's _prompting_ you.

🍄 **Now let's break down the elements of the prompt:**

1️⃣ `user` and `computer` are the names you set up for yourself and your computer \
For example, <ins>my user name is letixa and my computer name is eujenio</ins>. You can set them to anything you want! 
    
2️⃣ `directory` is the folder you are currently in (*computer people use this fancy name directory, which really just means folder*)
* some operational systems (OS) will only show the name of the directory, while others will show the whole path to that directory.
* when you open your terminal, the directory will show as `~`. This is a path symbol that represents your **HOME directory**.

3️⃣ `$` or `%` is a prompt symbol, indicating that the terminal is waiting for a command. \
When you see this symbol, it means it's ok to type stuff on the terminal!
    
_What about the `(base)` that shows on my screenshot?_ \
This is to indicate which environment you are in - we will see more details about that in the future.


## 3. Using bash in the  terminal

> [!IMPORTANT]
> ### **List of commands**
>
> * `pwd` Print working directory: shows the directory you are in right now
> * `cd` Change directory: moves to a different directory through the path you indicate
> * `ls` List: lists all the contents of a directory (files, subdirectories)
> * `mkdir` Make directory: creates a new directory
> * `nano`: text editor, for creating and editing text files
> * `cat` Concatenate: displays the contents of a file or files
> * `mv` Move: move or rename files or directories

### 🍄 **Moving between different directories**

**🐞 First, let's find out where we are** (aka our working directory) <br>
Type `pwd` in your prompt, then hit Enter <br>
You should see a set of words separated by slashes show up in the next line, like in the example below:
    
```bash
(base) letixa@eugenio ~ % pwd   
/Users/letixa
```
    
**This line represents the complete pathway to the directory (folder) you are currently in.** <br>
In my case, I am in my home directory, located at `/Users/letixa`. <br>

**🐞 What files are inside my home directory?** _We can use `ls` to find out! <br>_
Type `ls` in your prompt, then hit Enter \
The screen will show a bunch of words - these are the names of all folders and files you have inside your home directory. 
    
```bash
(base) letixa@eugenio ~ % ls
Applications            Library                 Public
Desktop                 Mesquite_Support_Files  Zotero
Documents               Movies                  src
Downloads               Music                   zsh-syntax-highlighting
Google Drive            Pictures
```

**🐞 Now let's go to the directory where we want to work!** <br> 
Choose a folder in your home to start organizing your tutorial files. Then, navigate to that folder using `cd` followed by the folder name. <br>
For example, I want to go to my Documents directory, which is inside my home directory:
    
```bash
(base) letixa@eugenio ~ % cd Documents
(base) letixa@eugenio Documents %  
```
   
Note that the `directory` on your prompt has now changed from `~` to the name of the directory you just entered (in my case, `Documents`). Now you are inside Documents! 

**🐞 What if I want to go to a folder that's inside another folder?** \
In that case, if you try to just type the name of the folder, the computer won't know where to go.\
You need to use `cd` along with _the complete path to that folder starting from your current location_, like this:

```bash
(base) letixa@eugenio ~ % cd Documents/work
(base) letixa@eugenio work % 
```
In this example, I went to the directory `work`, which is inside `Documents`. If I had just used `cd work`, I would get an error like this:

```bash
(base) letixa@eugenio ~ % cd work
cd: no such file or directory: work
```

In this error, the computer is saying "there's nothing called work here". Because you are typing the command from your home, and your work directory is not inside home (it is inside home > Documents).

> [!TIP]
> **And here we get to an important terminal lesson: <br>**
> A command on the terminal only works if your are running it from the correct location!
> That basically means that:
> * if the file or folder targeted by your command is located where you are, you can just type `[command] [space] [name of file/folder]`
> * **however**, if your target is in a different location, your command needs to inform the path to that file or folder, so you should type `[command] [space] [path to file/folder]`. We will see many examples of this later!

***

### **🍄 Creating directories and files**

_Now that you are in the right location to store your tutorials, let's start making some folders to keep things organized!_

**🐞 Create a master directory** <br>
First, we'll make a master folder to contain everything related to our tutorials. <br>
For that, enter the `mkdir` command followed by the name you wish to give your folder, like this:
```bash
mkdir tutorials_2025
```
Now enter `ls`, to check if the folder was created. You should see it showing up in your screen like this:
```bash
(base) letixa@eugenio Documents % ls
tutorials_2025
```
You may have other folders in there as well - as long as you see the name of the folder you just created, it's all good!\
Now go inside our `tutorials_2025` directory by using: 

```bash
cd tutorials_2025
```
and list what inside of it using `ls`. You should get an empty line, because the folder is empty:

```bash
(base) letixa@eugenio tutorials_2025 % ls
(base) letixa@eugenio tutorials_2025 % 
```

**🐞 Create a README file** \
Next, let's use the command `nano` to create a `README.txt` file inside your master folder:

```bash
nano README.txt
```
As soon as you enter this command, you should see an *empty black screen*. It's all good! This is how an empty document looks on your terminal. You can type anything on it and it will be saved as a text file! So let's do it:

* Type down a title for your README file (for example README - BIOINFORMATICS TUTORIALS 2025). <br>
* Then use `Ctrl + X`, followed by Y and Enter to exit and save the file. <br>

Now, let's enter `ls` to see what's inside your `tutorials_2025` folder. You should see a result like this:
```bash
(base) letixa@eugenio tutorials_2025 % ls
README.txt
```
You can come back to re-edit this file at any time, by entering `nano README.txt`, typing new lines below the title and then saving the document. \
To learn more about the `nano` command and how to use it, check out this [video tutorial](https://www.youtube.com/watch?v=g2PU--TctAM&ab_channel=SavvyNik)!

**🐞 What if I want to see what's written on my file?** \
To take a look at any text file, we can use the command `cat`, followed by the file name. \
Type `cat README.txt` on your terminal and hit Enter. The terminal will display the content of your file, like this:

```bash
(base) letixa@eugenio tutorials_2025 % cat README.txt 
README - BIOINFORMATICS TUTORIALS 2025
```
The only thing written on your file is the title - so that's what the terminal will show!

>[!NOTE]
> To take this lesson further, try writing the content of your README file! \
> For more information on how to write a README file, check this webpage: https://www.makeareadme.com/

***

### 🍄 Changing and moving files

_Can I change the name and location of a file?_ \
Yes you can! The `mv` command allows you to do both. Let's check it out:

**🐞 Renaming a file:** \
Let's assume you wanted to change the name of your README file to `README_tutorials.txt`, to make it more specific. You can do that by entering `mv` followed by the old name, then the new name, like this:

```bash
mv README.txt README_tutorials.txt
```
And, to check if the command worked, let's use `ls`: 

```bash
(base) letixa@eugenio tutorials_2025 % ls
README_tutorials.txt
```
Looks good!

**🐞 Moving a file:** \
Let's say you made a mistake and created the `README.txt` file inside `Documents`, instead of `tutorials_2025`. Creating a file in the wrong folder is a very common mistake, so how can we correct it? \
From inside `Documents`, we can enter mv followed by the file name and the new location, like this:
```bash 
(base) letixa@eugenio Documents % mv README.txt tutorials_2025
```
You can now navigate to `tutorials_2025` and check if `README.txt` is there, like this:

```bash
(base) letixa@eugenio Documents % cd tutorials_2025 
(base) letixa@eugenio tutorials_2025 % ls
README.txt           
````
Success!

## 4. Challenge: creating a folder structure
_Every bioinformatician needs to be organized!_ <br>
In this challenge, we will create folders to store data, notes and exercises for our tutorials. <br>
Try to type the command by yourself first, then click on the toggle to check. <br>
(Before starting, make sure you are inside the `tutorials_2025` folder)

🐞 Create a directory named `sandbox` <br>
A sandbox is a place where we can test everything without compromising our analysis. It's always good to have one!

<details>

<summary>Click to check command</summary>

```bash
   mkdir sandbox
 ```
</details>

🐞 Create one directory for each tutorial. <br>
Suggestion of name: `tutorial_1`, `tutorial_2`, etc (always use `_` instead of spaces, because spaces don't go well in the terminal)

<details>

<summary>Click to check command</summary>

There's two ways you can do this:
* using mkdir individually for each folder, or 
* creating all folders at once:
```bash
   mkdir tutorial_1 tutorial_2 tutorial_3 tutorial_4 tutorial_5 tutorial_6
 ```
</details>

Now when you list the content of your master folder, you should see something like this:
```bash 
(base) letixa@eugenio tutorials_2025 % ls
README.txt tutorial_1 tutorial_3 tutorial_5
sandbox    tutorial_2 tutorial_4 tutorial_6
```

> [!WARNING]
> **Got an error after typing a command?** <br>
> Here's a few things you can check before telling your computer to go to %@#! 
> * Are you in the right folder? 
> * Did you type the right pathways for the input options?
> * Did you spell everything right? No typos?
> 
> **Remember**: Computers are really dumb! You have to tell them exactly what you want. <br>

## 5. Installing software

To end this tutorial, we will install two software packages that will be very important in our future works (and they're good to have overall). Copy and paste the commands below on your terminal to install **Homebrew** and **Git**.

**🐞 Homebrew**: package manager for MacOS
- We'll follow the instructions on the [this page](https://brew.sh/) to install Homebrew
- It will make it easier for us to install all sorts of other software and packages!

**🐞 Git**: repository manager
* Git helps us keep track of the changes we make in our files across time, and it's great for collaborative work.

**How to install Git on MacOS:** 

```bash
brew install git 
# This command uses homebrew to install git on your computer
```
**How to install Git on Linux/Unix:** 
```bash
sudo apt-get install git-all
# Linux has a native function called apt-get install 
# that you can use to get a lot of programs
```
> [!NOTE]
> You can use `git --version` to find out what version of Git you have installed.
