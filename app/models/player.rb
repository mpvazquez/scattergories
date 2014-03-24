class Player < ActiveRecord::Base

  after_initialize do
    @scores = []
    @answers = []

    $redis.HSET(round.id, "Player#{player.id}", @scores)
    $redis.HSET(round.id, "Player#{player.id}", @answers)
  end

  def auto_reject(answers)
    self.after_initialize
    (0..11).each do |index|

      # TODO Record each answer on Redis
      if answers[index].to_s == "" || answers[index].to_s.first != $letter
        self.set_score(index, 0);
        $redis.HSET(round.id, "Player#{player.id}", )
      else
        self.set_score(index, 1);
        # $redis.HSET
      end
    end
    self.scores
  end

  def finalize_answers(scores)
    self.after_initialize
    (0..11).each do |index|
      self.set_score(index, scores[index])
    end
    self.scores
  end

  def set_score(index, score)
    # TODO Record each answer's current score on Redis
    self.scores[index] = score
  end

  def scores
    @scores
  end

end
