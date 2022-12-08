class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum role: [:admin , :staff , :client]

  after_initialize :set_default_role , :if => :new_record?

  belongs_to :subsidiary
  has_many :turns , class_name: 'Turn' , foreign_key: :client_id
  has_many :turns_attended , class_name: 'Turn' , foreign_key: :staff_id

  validates :subsidiary, presence:{message: "El personal bancario debe asignarse a una sucursal"} , if: :is_staff?

  def set_default_role
    self.role ||= :user
  end

  def is_staff?
    self.role == "staff"
  end
end
