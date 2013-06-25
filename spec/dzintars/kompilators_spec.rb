# encoding: utf-8
require "spec_helper"

aprakstīt "Kompilators" do
  lai(:sākuma_kods) do
    "# encoding: utf-8\nrequire \"dzintars/core_ext\"\n"
  end

  lai(:kompilators) do
    Dzintars::Kompilators.new
  end

  tas "nokompilē tukšu Dzintara programmu" do
    kompilators.uz_ruby("").should == sākuma_kods + ""
  end

  aprakstīt "skaitļi" do

    tas "nokompilē veselu skaitli" do
      kompilators.uz_ruby("1").should == sākuma_kods + "1"
    end

    tas "nokompilē daļskaitli" do
      kompilators.uz_ruby("1,2").should == sākuma_kods + "1.2"
    end

    tas "nokompilē daļskaitli" do
      kompilators.uz_ruby("1,2").should == sākuma_kods + "1.2"
    end

    tas "nokompilē sarakstu ar daļskaitli un veselu skaitli" do
      kompilators.uz_ruby("[1,2, 3]").should == sākuma_kods + "[1.2, 3]"
    end

  end

  aprakstīt "atslēgvārdi" do
    tas "aizvieto ja / tad / citādi / beigas" do
      kompilators.uz_ruby("ja 1 tad\n2\ncitādi\n3\nbeigas").should ==
        sākuma_kods + "1 ? (2) : (3)"
    end
  end

  aprakstīt "Kernel metodes" do
    tas "izveido puts iesauku izdrukāt_virkni" do
      kompilators.uz_ruby("izdrukāt_virkni 'abc'").should ==
        sākuma_kods + "izdrukāt_virkni(\"abc\")"
    end
  end


end
