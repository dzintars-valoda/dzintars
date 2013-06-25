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

  aprakstīt "Būla izteiksmes" do
    tas "aizvieto patiess ar true" do
      kompilators.uz_ruby("patiess").should == sākuma_kods + "true"
    end

    tas "aizvieto aplams ar false" do
      kompilators.uz_ruby("aplams").should == sākuma_kods + "false"
    end

    tas "aizvieto nav ar not" do
      kompilators.uz_ruby("nav patiess").should == sākuma_kods + "(not true)"
    end

  end

  aprakstīt "atslēgvārdi" do
    tas "aizvieto ja / tad / bet_ja / citādi / beigas" do
      kompilators.uz_ruby('
        ja 1 tad
          2
        bet_ja 3
          4
        citādi
          5
        beigas'
      ).should be_like(sākuma_kods +
        '1 ? (2) : (3 ? (4) : (5))'
      )
    end

    tas "aizvieto gadījumā / kad / tad / citādi / beigas" do
      kompilators.uz_ruby("
        gadījumā 1
        kad 1 tad 1
        kad 2
          2
        citādi
          3
        beigas"
      ).should be_like(sākuma_kods +
        'case 1
        when 1 then
          1
        when 2 then
          2
        else
          3
        end'
      )
    end

    tas "aizvieto sākt / glābt / celt / nodrošināt / beigas" do
      # raise ir Kernel metode nevis atslēgvārds
      kompilators.uz_ruby('
        sākt
          1 / 0
        glābt => kļūda
          mēģināt_vēlreiz
          celt kļūda, kļūda.ziņojums
        nodrošināt
          izdrukāt "Beigas"
        beigas'
      ).should be_like(sākuma_kods +
        'begin
          (1 / 0)
        rescue => kļūda
          retry
          celt(kļūda, kļūda.ziņojums)
        ensure
          izdrukāt("Beigas")
        end'
      )
    end

  end

  aprakstīt "Kernel metodes" do
    tas "izveido puts iesauku izdrukāt_virkni" do
      kompilators.uz_ruby("izdrukāt_virkni 'abc'").should ==
        sākuma_kods + "izdrukāt_virkni(\"abc\")"
    end
  end


end
