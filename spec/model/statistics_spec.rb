#encoding: utf-8

require 'spec_helper'

describe Statistics do
  context '#languages' do
    subject { described_class.new.languages }

    specify { should have(Questionary::LANGUAGES.size).items }
    specify { subject.values.all?(&:zero?).should be_true }

    it do
      Questionary.create!(:languages => ['Ruby', 'PHP'])
      Questionary.create!(:languages => ['C#', 'Ruby'])
      Questionary.create!(:languages => ['Java', 'PHP'])

      subject['Ruby'].should == 2
      subject['PHP'].should  == 2
      subject['Java'].should == 1
      subject['C#'].should   == 1
    end
  end

  context '#experience' do
    subject { described_class.new.experience }

    specify { should have(Questionary::EXPERIENCE.size).items }
    specify { subject.values.all?(&:zero?).should be_true }

    it do
      Questionary.create!(:experience => ['3-6 лет'])
      Questionary.create!(:experience => ['3-6 лет'])
      Questionary.create!(:experience => ['меньше года'])

      subject['3-6 лет'].should == 2
      subject['меньше года'].should == 1
    end
  end

  after do
    Questionary.delete_all
  end
end
