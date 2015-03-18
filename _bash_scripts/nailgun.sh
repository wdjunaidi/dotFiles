# 
# Aliases to utilize Nailgun - which startup 1 JVM to be used by
# all process, reduce JVM startup cost
#
alias ngs='JRUBY_OPTS="" jruby --ng-server'
alias ng='JRUBY_OPTS="$JRUBY_OPTS --ng" '
alias nruby='JRUBY_OPTS="$JRUBY_OPTS --ng" jruby'
alias ngem='nruby -S gem'
alias nirb='nruby -S irb'
alias nrails='nruby -S rails'
