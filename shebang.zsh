#!/usr/bin/env zsh

echo "\n<<< Running $0 >>>\n"

exists brew && echo "excellent!!!" || echo "bogus"
exists nonexistent $0 && echo "excellent" || echo "bogus!!!"

which exists