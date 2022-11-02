class GistQuestionService
  Result = Struct.new(:service_result) do
    delegate :html_url, to: :service_result, allow_nil: true

    def success?
      service_result&.html_url.present?
    end
  end

  def initialize(question, client = default_client)
    @question = question
    @test = @question.test
    @client = client
  end

  def call
    Result.new(@client.create_gist(gist_params.to_json))
  end

  private

  def default_client
    Octokit::Client.new(access_token: ENV['GITHUB_TOKEN']) # GitHubClient.new (-> /lib/clients/)
  end

  def gist_params
    {
      description: I18n.t('services.gist_question_service.description', test_title: @test.title),
      public: true,
      files: {
        'test_guru_question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end
end
