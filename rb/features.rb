# Sharedmobilitych SDK feature factory

require_relative 'feature/base_feature'
require_relative 'feature/test_feature'


module SharedmobilitychFeatures
  def self.make_feature(name)
    case name
    when "base"
      SharedmobilitychBaseFeature.new
    when "test"
      SharedmobilitychTestFeature.new
    else
      SharedmobilitychBaseFeature.new
    end
  end
end
