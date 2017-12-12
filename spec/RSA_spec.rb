require(File.expand_path('../lib/RSA.rb', File.dirname(__FILE__)))

RSpec.describe RSA do
	rsa = RSA.new(43,17,59)
	testing_helper = RSA.new(331,89,57)
    it "checks if the return is the right n" do
        expect(rsa.n).to eq 43
    end
    it "checks if the return is the right e" do
        expect(rsa.e).to eq 17
    end
    it "checks if the return is the right d" do
        expect(rsa.d).to eq 59
    end
	it "checks if it encrypts and decrypts corecctly with my own values" do 
		expect(testing_helper.decrypt(testing_helper.encrypt("Simeon"))).to eq "Simeon"
	end
	
	it "checks if it encrypts and decrypts corecctly with random generated values" do
		rand_keys = testing_helper.new_key
		parsed_keys = RSA.new rand_keys[0],rand_keys[1],rand_keys[2]
		expect(parsed_keys.decrypt(parsed_keys.encrypt("Sim3on Ch@k@rov #24 11B"))).to eq "Sim3on Ch@k@rov #24 11B"
	end
	
end
