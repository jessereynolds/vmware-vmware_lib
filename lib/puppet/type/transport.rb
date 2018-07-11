# Copyright (C) 2013 VMware, Inc.
Puppet::Type.newtype(:transport) do
  @doc = "Manage transport connectivity info such as username, password, server."

  newparam(:name, :namevar => true) do
    desc "The name of the network transport."
  end

  newparam(:username) do
  end

  newparam(:password) do
  end

  newparam(:server) do
  end

  newparam(:options) do
    validate do |value|
      fail("Option value must be a hash.") unless value.is_a? ::Hash
    end
    defaultto({})
  end

  # NOTE: Should match the behavior of the default titlepattern which is to set
  #       the `name` parameter. Intentionally uses a lambda to disqualify this
  #       type from compilation by `puppet generate types` so that the
  #       metaparameter definition below still works.
  #
  # FIXME: This is some epic hacky bullshit that will extract a price from
  #        someone in the future If you're reading this comment, find a way
  #        to kill this. Good luck and godspeed.
  def self.title_patterns
    [[/(.*)/m, [[:name, lambda {|x| x}]]]]
  end

end

unless Puppet::Type.metaparams.include? :transport
  Puppet::Type.newmetaparam(:transport) do
    desc "Provide a new metaparameter for all resources called transport."
  end
end
