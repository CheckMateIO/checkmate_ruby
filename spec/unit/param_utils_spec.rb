require_relative '../spec_helper'

describe Checkmate::ParamUtils do 
  it "generates nothing if need be" do
    expect(Checkmate::ParamUtils.encode({})).to eq ""
    expect(Checkmate::ParamUtils.encode(nil)).to eq ""
  end

  it "generates a straight-forward query string" do
    expect(Checkmate::ParamUtils.encode({a: 1, b: "c"})).to eq "a=1&b=c"
  end

  it "handles nested hashes" do
    expect(Checkmate::ParamUtils.encode({a: {b: 'c', d: 'e'}, f: 'g'})).to \
        eq "a[b]=c&a[d]=e&f=g"
  end

  it "handles arrays" do
    expect(Checkmate::ParamUtils.encode({a: ['bingo', 'hepp']})).to \
        eq "a[]=bingo&a[]=hepp"
  end

  it "handles arrays of hashes" do
    expect(Checkmate::ParamUtils.encode({a: [{b:'c', d:'e'}, {b:'g'}]})).to \
        eq "a[][b]=c&a[][d]=e&a[][b]=g"
  end
end
