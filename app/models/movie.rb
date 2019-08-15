class Movie < ActiveRecord::Base
  belongs_to :movie
  has_many :messages, lambda {order("#{Message.table_name}.created_on DESC")}, :dependent => :destroy
  belongs_to :last_message, :class_name => 'Message'
  acts_as_tree :dependent => :nullify
  acts_as_positioned :scope => [:project_id, :parent_id]
  acts_as_watchable

  validates_presence_of :name, :description
  validates_length_of :name, :maximum => 30
  validates_length_of :description, :maximum => 255
  validate :validate_board
  attr_protected :id

  scope :visible, lambda {|*args|
    joins(:project).
        where(Project.allowed_to_condition(args.shift || User.current, :view_news, *args))
  }

  def validate_board
    if parent_id && parent_id_changed?
      errors.add(:parent_id, :invalid) unless valid_parents.include?(parent)
    end
  end

  def self.latest(reservation = Reservation.current, count = 5)
    visible(reservation).preload(:author, :project).order("#{News.table_name}.created_on DESC").limit(count).to_a
  end
end

