# encoding: utf-8
require "spec_helper"

aprakstīt "Virkne" do

  lai(:kompilators) do
    Dzintars::Kompilators.new
  end

  tas "apgriezt(#reverse) rindu otrādi" do
    rezult = eval kompilators.uz_ruby("'smuka meitene'.apgriezt")
    rezult.should == 'enetiem akums'
  end

  tas "rindas garums(#length)" do
    rezult = eval kompilators.uz_ruby("'Latvija'.garums")
    rezult.should == 7
  end

end