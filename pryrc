# -+- mode: ruby -*-
# vi: set ft=ruby :

Pry.config.editor = proc { |file, line| "emacsclient +#{line} #{file}" }
Pry.commands.alias_command 'c', 'continue'
Pry.commands.alias_command 's', 'step'
Pry.commands.alias_command 'n', 'next'
Pry.commands.alias_command 'f', 'finish'
