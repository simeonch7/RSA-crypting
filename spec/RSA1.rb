require_relative '../lib/RSA1.rb'


RSpec.describe RSA do
	rsa = RSA.new(500,660,400)
	tester = RSA.new(3233,17,413)
    it "should return the right n" do
        expect(rsa.n).to eq 500
    end
    it "should return the right e" do
        expect(rsa.e).to eq 660
    end
    it "should return the right d" do
        expect(rsa.d).to eq 400
    end
	it "should encrpyt and decrypt correctly with hardcoded keys" do 
		expect(tester.decrypt tester.encrypt "Hello!").to eq "Hello!"
	end
	it "should encrpyt and decrypt complex sentence correctly with hardcoded keys" do 
		expect(tester.decrypt tester.encrypt "The lazy brown fox jumped over the lazy dog!").to eq "The lazy brown fox jumped over the lazy dog!"
	end
	it "should return array new_key" do 
		expect(rsa.new_key.kind_of?(Array)).to eq true
	end
	it "should return correct lenght array from new_key" do 
		expect(rsa.new_key.length).to eq 3
	end
	it "should encrypt and decrypt correctly with the values of new_key" do
		new_keys = tester.new_key
		rsa_copy = RSA.new new_keys[0],new_keys[1],new_keys[2]
		expect(rsa_copy.decrypt rsa_copy.encrypt "Sim3on 4Ak@rov").to eq "Sim3on 4Ak@rov"
	end
	
end
