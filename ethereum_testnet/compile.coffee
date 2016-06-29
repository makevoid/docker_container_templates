# compile.coffee

solc = require 'solc'
fs   = require 'fs'
c    = console

name  = "simple_storage"

code = fs.readFileSync "./contracts/#{name}.sol"
code = code.toString()

contracts = solc.compile code
contracts = JSON.stringify contracts
fs.writeFileSync './config/contracts.json', contracts
