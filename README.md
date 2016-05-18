# SMPP Protocol

SMPP Protocol is complete native ruby SMPP 5.0 implementation.
It contains only SMPP entities (PDU) and parsing so it could be reused on different platforms.

There is already existing ``ruby-smpp`` gem, but its not maintained for few years and built upon EventMachine.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'smpp-protocol'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install smpp-protocol

## Usage

### Decoding

```ruby
require 'smpp/protocol'

# buffer might be String or IO object
pdu = SMPP::Protocol.parse(buffer)
# => SMPP::Protocol::PDU::DeliverSm

# Address Handling

pdu.source_address
# => 79001234568

pdu.source
# => SMPP::Protocol::Address(address: 79001234568, ton: 1, npi: 0)

pdu.source.ton
# => 1

pdu.destination.type_of_number
# => :international

# Short Message Handling

pdu.data_coding
# => 'UCS-2'

pdu.raw_data_coding
# => 8

pdu.message
# => "Hello World!" # Decode short_message using data_coding property, returns raw message if data_conding is unknown

pdu.raw_message
# => "\x00H\x00e\x00l\x00l\x00o\x00 \x00W\x00o\x00r\x00l\x00d\x00!" # 'Hello World!' encoded in USC-2 in ASCII

# TLV Handling

pdu.optional_params # pdu.tlv works as well
# => SMPP::Protocol::TLV

tlv = pdu.optional_params.tag(0x0501) # ussd_service_op TLV
# => SMPP::Protocol::TLV::UssdServiceOp

tlv.tag
# => 0x0501

tlv.name
# => :ussd_service_op

tlv.value
# => :ussr_request

tlv.raw_value
# => 3

pdu.optional_params.tags(:message_payload) # In case if there is many TLVs with same tag
# => [SMPP::Protocol::TLV::MessagePayload, ...]

```

### Encoding

```ruby
require 'smpp/protocol'


pdu = SMPP::Protocol::PDU::SubmitSM.new(
  data_coding: 'UCS-2',
  optional_params: [
    SMPP::Protocol::TLV::UssdServiceOp.new(value: :ussr_response),
    SMPP::Protocol::TLV::MessagePayload.new(value: 'Hello World!')
  ]
)

pdu.destination = SMPP::Protocol::Address(address: 79001234568, ton: 1, npi: 0)

pdu.source_address = '9999'
pdu.source_ton = :alphanumeric
pdu.source_npi = 0 # Unknown

# Message might be a Proc and would be evaluated only getter invoke or encoding
pdu.message = -> () { generate_message }

# Message would be encoded using specified data_coding or left as is (if data_coding is unknown)
# If message size is more than 255 bytes it would be automatically moved to `message_payload` TLV.
# To prevent that assign raw_message, it would be truncated to 255 symbols and not automatically encoded

pdu.raw_message = -> () { generate_raw_message }

# Encode PDU to binary string (in actually uses StringIO)
pdu.encode # aka pdu.to_binary
# => "\x04\x12\x04\x30\x04\x48...."

# Write encoded PDU into IO
pdu.write(io)
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/t3hk0d3/smpp-protocol.

