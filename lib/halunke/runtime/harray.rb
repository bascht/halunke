module Halunke
  module Runtime
    HArray = HClass.new(
      "Array",
      [],
      {
        "inspect" => HFunction.new([:self], lambda { |context|
          inspected_members = context["self"].ruby_value.map { |member| member.inspect(context) }
          HString.create_instance("[#{inspected_members.join(' ')}]")
        }),
        "=" => HFunction.new([:self, :other], lambda { |context|
          return context["false"] if context["self"].ruby_value.length != context["other"].ruby_value.length

          context["self"].ruby_value.zip(context["other"].ruby_value).map do |a, b|
            a.receive_message(context.parent, "=", [b])
          end.reduce(context["true"]) do |memo, value|
            memo.receive_message(context, "and", [value])
          end
        }),
        "map" => HFunction.new([:self, :fn], lambda { |context|
          return HArray.create_instance(context["self"].ruby_value.map do |x|
            context["fn"].receive_message(context, "call", [HArray.create_instance([x])])
          end)
        })
      },
      {},
      true
    )
  end
end