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
  before_destroy :can_delete?

  validates :subsidiary, presence:{message: "El personal bancario debe asignarse a una sucursal"} , if: :is_staff?

  def set_default_role
    self.role ||= :user
  end

  def is_staff?
    self.role == "staff"
  end

  private
  def can_delete?
      if self.staff? && ! self.turns_attended.empty?
          errors.add(:turns_attended, "No se puede eliminar un personal bancario con turnos atendidos")
          false
          throw(:abort)
      elsif self.client? && ! self.turns.empty?
          errors.add(:turns, "No se puede eliminar un cliente que tenga turnos pendientes o atendidos")
          false
          throw(:abort)
      else
          true
      end
  end
end
