source .aliases

alias run-tests="/usr/bin/nosetests --with-mocha-reporter -s ."
alias watch-tests="/usr/bin/nosetests --with-mocha-reporter --with-watch -s ."
alias ci-tests="/usr/bin/nosetests --with-xunit --xunit-file=test_output.xml"
alias lint="pylint -r n *.py"

alias src="cd /home/src/"

alias python=python3
