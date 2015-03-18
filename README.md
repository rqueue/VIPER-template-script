<h1>Use</h1>
Run the script by giving it an argument of the module name you want in camel case. The capitalization of the first letter is optional. For example, the follow two commands will both create the same thing:
```
$ ./viper-template.sh myModuleName
$ ./viper-template.sh MyModuleName
```
Both of these commands will produce the following folders/files:
```
/MyModuleName
  /MyModuleName      # main files in here
  /Specs
    /MyModuleName    # spec files in here
```
The `MyModuleName` directory contains the actual VIPER temnplate files and the `MyModuleNameSpecs` directory contains blank Cedar spec files for all the module files less the view.

<b>Note:</b> All files will be prefixed with "BR" currently.
