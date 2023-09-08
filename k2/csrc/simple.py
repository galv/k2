def beam_search():
    output_tokens = []
    for t in range(T):
        most_likely_token = argmax(model.forward(audio[t]))
        if t == 0:
            output_tokens.append(most_likely_token)
        elif most_likely_token == "blank":
            continue
        elif most_likely_token == output_tokens[-1]:
            continue
        else:
            output_tokens.append(most_likely_token)
