# encoding: utf-8
require "spec_helper"

aprakstīt "Kompilators" do

  lai(:kompilators) do
    Dzintars::Kompilators.new
  end

  before(:each) do
    $stdout = StringIO.new
  end

  after(:each) do
    $stdout = STDOUT
  end

  tas "izveido puts iesauku izdrukāt_virkni" do
    eval kompilators.uz_ruby("izdrukāt_virkni 'abc'")
    $stdout.string.should == "abc\n"
  end

end
