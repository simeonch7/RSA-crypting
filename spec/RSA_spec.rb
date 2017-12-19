require(File.expand_path('../lib/RSA.rb', File.dirname(__FILE__)))


RSpec.describe RSA do
	rsa = RSA.new(151, 17, 29)

		it "checks if the return is the right n" do
			expect(rsa.n).to eq 151
		end
		it "checks if the return is the right e" do
			expect(rsa.e).to eq 17
		end
		it "checks if the return is the right d" do
			expect(rsa.d).to eq 29
		end

	
		it "should encrypt and decrypt correctly with random generated values " do
			rand_keys = rsa.new_key
			parsed_keys = RSA.new(rand_keys[0],rand_keys[1],rand_keys[2])
			expect(parsed_keys.decrypt parsed_keys.encrypt "ZimEon Ch@k@rOOv").to eq "ZimEon Ch@k@rOOv"
		end
end
