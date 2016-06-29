# warning: this is a coffeescript file written in iced-coffee-script
# run this file with: iced app.coffee # compile it via: iced -c app.coffee

Web3 = require "web3"
fs   = require 'fs'

# host = "http://localhost:8545"
# web3 = new Web3(new Web3.providers.HttpProvider host)

ipc      = "/datadir/geth.ipc"
console.log "IPC path: #{ipc}\n"
provider = new Web3.providers.IpcProvider  ipc, require('net')
web3     = new Web3 provider


eth  = web3.eth
c    = console

address = null

# in iced coffeescript calls become from this (asynchronous):
#
#   eth.getCoinbase (_, address) ->
#     c.log "Coinbase account address: #{address}"
#
# to this (synchronous via await/defer):
#
await eth.getCoinbase defer _, address
c.log "Coinbase account address: #{address}"

await eth.getBalance address,  defer _, balance
c.log "Balance: #{balance}\n"

process.exit 0

# contracts_compiled = fs.readFileSync './config/contracts.json'
# contracts_compiled = JSON.parse contracts_compiled
# contract_compiled = contracts_compiled.contracts.SimpleStorage
# abi      = JSON.parse contract_compiled.interface
# bytecode = contract_compiled.bytecode
#
# # contract class
# SimpleStorage = eth.contract abi
#
# # TODO: read from file
# contract_address = null
# # contract_address = "0xfd17dc839a122e62aae0974b5f491b4f81f6ede1"
#
# if contract_address
#   simpleStorage = SimpleStorage.at contract_address
#   data = simpleStorage.data()
#   c.log "data (raw):", data
#   c.log "data:", web3.toAscii data
#
#   simpleStorage.set "abcd",
#     from: address
#
# unless contract_address
#   simpleStorage = SimpleStorage.new
#     data: bytecode
#     from: address
#     # gas:  1e10
#     (err, contract) ->
#       if err
#         c.error err
#       else
#         unless contract.address
#           c.log "TX:", contract.transactionHash
#         else
#           c.log "Contract address:", contract.address
#           process.exit 0
