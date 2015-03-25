require 'spec_helper'
require 'user'

RSpec.describe User do
  describe 'validations' do
    context '#name' do
      it { is_expected.to allow_value('foo').for(:name) }
      it { is_expected.to_not allow_value('').for(:name) }
      it { is_expected.to_not allow_value(nil).for(:name) }
    end
  end

  describe '#to_repository' do
    let(:attributes) { {name: 'foo'} }
    let(:user) { User.new(attributes) }
    subject { user.to_repository }

    its(:id) { is_expected.to eq nil }
    its(:name) { is_expected.to eq 'foo' }

    context 'with an ID' do
      context 'when Repository record exists' do
        let(:record) { User::Repository.create!(name: 'foo') }
        before { user.instance_variable_set :@id, record.id }

        its(:id) { is_expected.to eq record.id }
        its(:name) { is_expected.to eq 'foo' }
        its(:persisted?) { is_expected.to eq true }

        context 'but differs' do
          let(:attributes) { {name: 'bar'} }
          its(:name) { is_expected.to eq 'bar' }
        end
      end

      context 'when Repository record missing' do
        let(:random) { rand(999) }
        before { user.instance_variable_set :@id, random }

        its(:id) { is_expected.to eq random }
        its(:persisted?) { is_expected.to eq false }
      end
    end
  end
end
