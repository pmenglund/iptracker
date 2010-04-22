class Verification < ActiveRecord::Base
  belongs_to :ip_address
  attr_accessible :ip_address_id, :lookup, :reverse_lookup, :ping

  # 
  def self.verify_cidr(cidr)
    $stderr.puts "verifying cidr #{cidr.cidr}"
    cidr.ip_addresses do |ip|
      $stderr.puts "verifying #{ip.ip_address}"
      verify_ip(ip)
    end
  end
  
  def self.verify_ip(ip)
    return unless ip.usable?
    lookup = nil
    reverse_lookup = nil
    ping = nil

    # lookup: name to IP
    unless ip.name.blank?
      begin
        s = Socket.getaddrinfo(ip.name, nil)
        lookup = s[0][3]
      rescue SocketError => e
      end
    end
    
    # reverse_lookup: IP to name
    begin
      s = Socket.getaddrinfo(ip.ip_address, nil)
      reverse_lookup = s[0][2] == ip.ip_address ? nil : s[0][2]
    rescue
    end

    begin
      ping = ping_from_nmap(ip.ip_address)
    rescue Exception => e
    end
    
    v = Verification.new(:ip_address_id => ip.id, :lookup => lookup,
      :reverse_lookup => reverse_lookup, :ping => ping)
    v.save
  end
  
  protected
  
  def self.ping_from_nmap(ip)
    file = "/tmp/#{ip}.nmap"
    cmd = "nmap -sP -oG #{file} #{ip}"
    out = %x{#{cmd} 2>&1}
    unless $? == 0
      $stderr.puts "ERROR: failed to execute nmap"
      return nil
    end
    File.open(file).readlines.each do |line|
    #%x{cat #{file}}.split("\n").each do |line|
      if line =~ /Host:\s+(\d+\.\d+\.\d+\.\d+)\s+\((.*)\)\s+Status:\s+(\S+)/
        File.unlink(file)
        return $3 == "Up"
      elsif line =~ /^#/
        # skip sliently
      else
        $stderr.puts "failed to match #{line}"
      end
    end
    File.unlink(file)
    nil
  end
  
end
