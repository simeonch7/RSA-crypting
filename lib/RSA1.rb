require "prime.rb"  


class RSA
    def initialize n, e, d
       @n = n
       @e = e
       @d = d
    end
    def n
       @n
    end

    def e
       @e
    end 

    def d
       @d
    end
    
    def new_key
        p = Prime.first 200
        q = Prime.first 200
        p = p.at(rand(1...200))
        loop do 
            q = q.at(rand(1...200))
            break if p != q
        end
        n = p * q
        tot = (p-1).lcm(q-1)
        e = 0;
        loop do
            e = rand(1...tot)
            break if e.gcd(tot) == 1
        end   
        d = 0
        inv = 0
        loop do
            if (e * inv) % tot == 1
               d = inv
               break
            end
            inv+=1
        end
        [n,e,d]
    end
    
    def encrypt message
        message.each_char.map {|c|   ((c.ord ** @e % @n)).to_s }.join(":")
    end
    
    def decrypt message
       message.split(":").map{| chunk |  (chunk.to_i ** @d % @n).chr }.join("")
    end 
 end
