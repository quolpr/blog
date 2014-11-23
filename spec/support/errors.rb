module BlogTest
  class RecordNotFound < ActiveRecord::RecordNotFound
    def initialize

    end
  end

  class RecordInvalid < ActiveRecord::RecordInvalid
    def initialize

    end
  end
end
