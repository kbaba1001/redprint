require 'redsnow'
require 'pathname'

source = Pathname('./sources/01. Simplest API.md')

result = RedSnow.parse(source.read, exportSourcemap: true)

puts result.ast.name
puts result.ast.description

puts result.ast.resource_groups.first.resources.first.actions.first.method # => GET
puts result.ast.resource_groups.first.resources.first.uri_template # => /message
p result.ast.resource_groups.first.resources.first.actions.first.examples
 # [#<RedSnow::TransactionExample:0x0055943ab0e270
 #  @description="",
 #  @name="",
 #  @requests=[],
 #  @responses=
 #   [#<RedSnow::Payload:0x0055943ab0e090
 #     @body="Hello World!\n",
 #     @description="",
 #     @headers=#<RedSnow::Headers:0x0055943ab0de38 @collection=[{:name=>"Content-Type", :value=>"text/plain"}]>,
 #     @name="200",
 #     @schema="">]>]



puts result.ast.name
puts result.sourcemap.name
