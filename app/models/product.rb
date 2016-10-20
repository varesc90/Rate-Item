class Product < ActiveRecord::Base
	validates(:product_name, presence: true)
	
	belongs_to (:user)
	belongs_to (:subdepartment)
	has_one(:productinformation)
	has_many(:votes)
	accepts_nested_attributes_for (:productinformation)

	has_attached_file(:product_pic, styles: {thumbnail: '100x100>', full: '300x300>'},
										storage: :s3,
										s3_region: 'us-east-1',
										s3_credentials: {bucket: "",
														 access_key_id: "",
										                 secret_access_key: ""})

	validates_attachment_content_type :product_pic, content_type: /\Aimage\/.*\z/

  def s3_credentials
    {:bucket => "", :access_key_id => "", :secret_access_key => ""}
  end

  def number_of_positive_vote
  	return self.votes.where(result:true).count
  end

  def number_of_negative_vote
  	return self.votes.where(result:false).count
  end
  
  def number_of_vote
  	return self.votes.count
  end

  def self.search(search)
  	if search
  		search = "%#{search}%"

  		includes(subdepartment: :department).
  		where("products.product_name LIKE ? OR departments.departmentname LIKE ?", search, search).
  		references(:department)	
  	end
  end
 end
