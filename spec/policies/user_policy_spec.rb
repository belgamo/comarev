require 'rails_helper'

describe UserPolicy do
  subject { UserPolicy.new(user, new_user) }

  let(:new_user) { create(:user) }

  context "for a regular user" do
    let(:user) { create(:user) }

    it { is_expected.not_to authorize(:create) }
    it { is_expected.not_to authorize(:destroy) }
    it { is_expected.not_to authorize(:index) }
  end

  context "for an admin user" do
    let(:user) { create(:user, :admin) }

    it { is_expected.to authorize(:create) }
    it { is_expected.to authorize(:destroy) }
    it { is_expected.to authorize(:index) }
  end
end
