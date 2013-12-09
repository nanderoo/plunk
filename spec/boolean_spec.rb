require 'spec_helper'

describe 'boolean searches' do
  it 'should parse last command with boolean' do
    @parsed = @parser.parse 'last 1h (foo OR bar)'
    expect(@parsed[:search][:match].to_s).to eq '(foo OR bar)'
  end

  it 'should parse a single field / value complex boolean expression' do
    @parsed = @parser.parse 'ids.attackers=(bar OR car)'
    expect(@parsed[:field].to_s).to eq 'ids.attackers'
    expect(@parsed[:value].to_s).to eq '(bar OR car)'
    expect(@parsed[:op].to_s).to eq '='
  end

  it 'should parse a single boolean expression' do
    @parsed = @parser.parse '(bar OR car)'
    expect(@parsed[:match].to_s).to eq '(bar OR car)'
  end
end