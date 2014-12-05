require_relative '../spec_helper'

describe Checkmate::QueryParamUtils do 
  it "generates nothing if need be" do
    expect(Checkmate::QueryParamUtils.encode({})).to eq ""
    expect(Checkmate::QueryParamUtils.encode(nil)).to eq ""
  end

  it "generates a straight-forward query string" do
    expect(Checkmate::QueryParamUtils.encode({a: 1, b: "c"})).to eq "a=1&b=c"
  end

  it "handles nested hashes" do
    expect(Checkmate::QueryParamUtils.encode({a: {b: 'c', d: 'e'}, f: 'g'})).to \
        eq "a[b]=c&a[d]=e&f=g"
  end

  it "handles arrays" do
    expect(Checkmate::QueryParamUtils.encode({a: ['bingo', 'hepp']})).to \
        eq "a[]=bingo&a[]=hepp"
  end

  it "handles arrays of hashes" do
    expect(Checkmate::QueryParamUtils.encode({a: [{b:'c', d:'e'}, {b:'g'}]})).to \
        eq "a[][b]=c&a[][d]=e&a[][b]=g"
  end
end
