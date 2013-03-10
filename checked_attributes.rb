# このモジュールをインクルードした場合にのみ、
# attr_checked属性を利用可能になる
module CheckedAttributes  
  def self.included(base)
    base.extend ClassMethod
  end
  module ClassMethod
    def attr_checked(attribute, &validation)
      define_method "#{attribute}=" do |value|
        raise 'Invalid attribute' unless validation.call(value)
        instance_variable_set("@#{attribute}", value)
      end
      define_method attribute do
        instance_variable_get "@#{attribute}"
      end
    end
  end
end
