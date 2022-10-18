# Sample scripts practices

Samples that can be applied on the craft of bash scripts.

| file                      | features                                |
|---------------------------|-----------------------------------------|
| check-command-exist.sh    | Check if a program/command is available | 
| colours.sh                | Variables and helper function for colored text. |
| isolate-file-path-info.sh | Break down the path info of a file. |
| parameters-using-bash.sh  | Ways to handle input parameters (including stdin for pipe). |
| read-piped-value.sh       | Simple way to read from pipe |

## How to contribute

Merge requests are welcome. Some scripts might contain `TODO:` comments
making them good starting points.

Please keep in mind these requirements:

* Syntax must be clear and readable.
* Keep in mind that parts should be easily reusable.
* The script name must be clear about what it demonstrates.
* Use sh extension and make the file executable: `chmod +x script.sh`
* Add comments to explain what might be not too obvious from the code.
Comments may also delimit logical blocks but avoid fancy lines.
* Limit the approach demonstrated to it's conceptual context (e.g. No
need to implement `--help` or use colours if irrelevant for the topic).

