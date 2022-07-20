require 'rails_helper'

RSpec.describe Word, type: :model do
  describe 'columns' do
    it { is_expected.to have_db_column(:value).of_type(:string) }
    it { is_expected.to have_db_column(:language).of_type(:string) }
  end
  describe 'validations' do
    it { is_expected.to validate_presence_of(:value) }
    it { is_expected.to validate_presence_of(:language) }
  end
end
