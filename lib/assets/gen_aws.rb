require 'aws-sdk'
require 'active_support/time'

def generate_link(bucket, object_path, expiration_time)
	'''
	Generates an expiring aws link for bucket and object_path.
	Usage: generate_link("leada", "handbook/Handbook_Pt2.pdf", 36.hours.from_now)
	'''
	s3 = AWS::S3.new(
		:access_key_id => ENV["AWS_KEY_ID"],
		:secret_access_key => ENV["AWS_ACCESS_KEY"]
		)

	obj = s3.buckets[bucket].objects[object_path]

	#puts "%s::%s: \n\t%s" % [expiration_time, object_path, obj.url_for(:get, { :expires => expiration_time}).to_s]
	return obj.url_for(:get, {:expires => expiration_time}).to_s
end
